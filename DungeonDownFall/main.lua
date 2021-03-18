local composer = require ("composer")

display.setStatusBar( display.HiddenStatusBar )

math.randomseed( os.time() )


-- Reserve channel 1 for background music
audio.reserveChannels( 1 )
audio.reserveChannels( 2 )
audio.reserveChannels( 3 )
audio.reserveChannels( 4 )
-- Reduce the overall volume of the channel
audio.setVolume( 0.1, { channel=1 } )
audio.setVolume( 0.06, { channel=2 } )
audio.setVolume( 0.06, { channel=3 } )
audio.setVolume( 0.1, { channel=4 } )

composer.gotoScene("scene.menu")
