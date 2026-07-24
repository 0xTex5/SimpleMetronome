sub initPinPad()
    metronomeButtons.visible = false
    pinPad.visible = true
    pinrect = pinPad.boundingRect()
    pcenterx = (1280 - pinrect.width) / 2
    pcentery = (720 - pinrect.height) / 2
    pinPad.translation = [ pcenterx, pcentery ]

    pinPad.setFocus(true)

end sub

sub initMetButtons()
    pinPad.visible = false
    metronomeButtons.visible = true

    rect = metronomeButtons.boundingRect()
    centerx = (1280 - rect.width) / 2
    centery = (720 - rect.height) / 2
    metronomeButtons.translation = [ centerx, centery ]

    metronomeButtons.setFocus(true)

end sub

sub init()
    m.top.setFocus(true)
    m.top.backgroundUri = ""
    m.top.backgroundColor = "0x80000000"
    
    click = m.top.findNode("click")
    tempo = m.top.findNode("tempo")
    pinPad = m.top.findNode("pinPad")

    pinPad.visible = false

    metronomeButtons = m.top.findNode("metronomeButtons")

    metronomeButtons.buttons = [ "-", "Start/Stop", "+", "Keyboard" ]

    initMetButtons()

End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = true
    
    if press then
        if key = "OK"
            if click.state <> "playing"
                click.control = "play"
            end if
        end if
    end if
    
    return result 
end function