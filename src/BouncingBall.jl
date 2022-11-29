module BouncingBall

using Gtk

function main()
    # Physics
    position = 100rand(3)
    velocity = 100randn(3)
    t = time()
    function update_ball!(bounds)
        dt = time()-t
        t += dt
        for i in eachindex(position, velocity, bounds)
            position[i] += velocity[i]*dt
            lo, hi = bounds[i]
            position[i] = mod(position[i]-lo, 2(hi-lo))+lo
            if position[i] > hi
                position[i] = 2hi - position[i]
                velocity[i] = -velocity[i]
            end
        end
    end

    # Initialization
    c = @GtkCanvas()
    win = GtkWindow(c, "Bouncing Ball")

    # Rendering
    @guarded draw(c) do widget
        ctx = getgc(c)
        h = height(c)
        w = width(c)

        # Paint background
        rectangle(ctx, 0, 0, w, h)
        set_source_rgb(ctx, 0, 0, 0)
        fill(ctx)
        set_source_rgb(ctx, .4, .4, .4) # color and path can appear in either order
        rectangle(ctx, w/4, h/4, w/2, h/2)
        fill(ctx)

        # Compute physics
        r = 20
        depth = hypot(w,h)/sqrt(2)
        update_ball!([(r, w-r), (r, h-r), (0, depth-r)])

        # Paint ball
        set_source_rgb(ctx, .6, .5, 1)
        x,y,z = position
        z = z/depth + 1
        arc(ctx, (x-w/2)/z+w/2, (y-h/2)/z+h/2, r/z, 0, 2pi)
        fill(ctx)
    end

    # Event handling
    c.mouse.button1press = @guarded (widget, event) -> begin
        # Move toward the mouse position
        velocity[1] = event.x - position[1]
        velocity[2] = event.y - position[2]
        velocity[3] = 0       - position[3]
    end

    running = Ref(true)
    signal_connect(win, :destroy) do widget
        running[] = false
    end

    # Initialization part 2
    show(c)
    while !c.is_sized
        sleep(.0001) # Wait for the canvas to initialize before we can call getgc(c)
    end

    # Main loop
    while running[]
        c.draw(true) # Manually repaint the scene (this does not automatically clear the background)
        reveal(c) # Tell Gtk that the canvas needs to be re-drawn
        sleep(.0001) # Hand control back to Gtk to display the redrawn window and handle events.
    end
end

end
