const std = @import("std");

const c = @cImport({
    @cInclude("SDL3/SDL.h");
});

pub fn main() !void {
    std.debug.print("SDL: {d}.{d}.{d}\n", .{
        c.SDL_MAJOR_VERSION,
        c.SDL_MINOR_VERSION,
        c.SDL_MICRO_VERSION,
    });

    if (!c.SDL_Init(c.SDL_INIT_VIDEO)) {
        std.debug.print("SDL_Init failed: {s}\n", .{c.SDL_GetError()});
        return;
    }
    defer c.SDL_Quit();



    const window_width = 800;
    const window_height = 600;
    const window_flags = 0;
    const window = c.SDL_CreateWindow("klace", window_width, window_height, window_flags);
    const renderer = c.SDL_CreateRenderer(window, "klace");

    var running = true;
    while (running) {
        var event: c.SDL_Event;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_QUIT => running = false,
            }
        }

        c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        c.SDL_RenderClear(renderer);
    }

}
