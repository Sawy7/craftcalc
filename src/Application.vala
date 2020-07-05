public class App : Gtk.Application {
    public App() {
        Object (
            application_id: "com.github.Sawy7.craftcalc",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    private Gtk.ApplicationWindow create_window() {
        var window = new Gtk.ApplicationWindow(this);
        window.title = "CraftCalc";
        window.window_position = Gtk.WindowPosition.CENTER;
        window.set_default_size(400, 600);
        return window;
    }

    private Gtk.Box create_box(Gtk.ApplicationWindow window) {
        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 20);
        window.add(box);
        return box;
    }
    
    private void add_header(Gtk.Box box) {
        var label = new Gtk.Label("CraftCalc");
        label.name = "header";
        box.add(label);
    }
    
    private void add_image(Gtk.Box box) {
        var image = new Gtk.Image();
        image.set_from_file("../data/placeholder_icon.png");
        image.set_size_request(100, 100);
        box.add(image);
    }
    
    protected override void activate() {
        var main_window = create_window();       
        
        var css_provider = new Gtk.CssProvider();
        try {
            css_provider.load_from_path("../data/style.css");
        } catch (GLib.Error e) {
            warning("Stylesheet not found: %s", e.message);
        }
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );
         
        var main_window_box = create_box(main_window);
        add_header(main_window_box);
        add_image(main_window_box);
        main_window.show_all();
    }
    
    public static int main(string[] args)
    { 
        var app = new App();
        return app.run(args);
    }
}
