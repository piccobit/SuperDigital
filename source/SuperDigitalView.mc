using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class SuperDigitalView extends Ui.WatchFace {

    var fontComicSansMS = null;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        // fontComicSansMS = Ui.loadResource(Rez.Fonts.ComicSansMS);
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Update the view
    function onUpdate(dc) {
        // dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        // dc.clear();

        // Get and show the current time
        var clockTime = System.getClockTime();
        var hour = clockTime.hour;
        if (!Sys.getDeviceSettings().is24Hour) {
            hour = hour % 12;
            if (hour == 0) {
                hour = 12;
            }
        }

        var hourString = Lang.format("$1$", [clockTime.hour.format("%02d")]);
        var minuteString = Lang.format("$1$", [clockTime.min.format("%02d")]);

        // This will break if it doesn't match your drawable's id!
        var hourView = View.findDrawableById("HourLabel");
        var minuteView = View.findDrawableById("MinuteLabel");

        hourView.setText(hourString);
        minuteView.setText(minuteString);

        View.onUpdate(dc);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
