sub initPinPad()
    m.metronomeButtons.visible = false
    m.pinPad.visible = true
    pinrect = m.pinPad.boundingRect()
    pcenterx = (1920 - pinrect.width) / 2
    pcentery = (720 - pinrect.height) / 2
    m.pinPad.translation = [ pcenterx, pcentery ]

    m.pinPad.setFocus(true)

end sub

sub initMetButtons()
    m.pinPad.visible = false
    m.metronomeButtons.visible = true

    rect = m.metronomeButtons.boundingRect()
    centerx = (1920 - rect.width) / 2
    centery = (720 - rect.height) / 2
    m.metronomeButtons.translation = [ centerx, centery ]

    m.metronomeButtons.setFocus(true)

end sub

sub init()
    m.top.setFocus(true)
    m.top.backgroundUri = ""
    m.top.backgroundColor = "0x80000000"
    
    click = m.top.findNode("click")
    tempo = m.top.findNode("tempo")
    m.pinPad = m.top.findNode("pinPad")

    m.pinPad.visible = false

    m.metronomeButtons = m.top.findNode("metronomeButtons")

    m.metronomeButtons.buttons = [ "-", "Start/Stop", "+", "Keyboard" ]

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