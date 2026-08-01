sub initPinPad()
    m.tempo.visible = false
    m.pinPadLabel.visible = true
    m.metronomeButtons.visible = false
    m.pinPad.visible = true
    pinrect = m.pinPad.boundingRect()
    pcenterx = (1920 - pinrect.width) / 2
    pcentery = (720 - pinrect.height) / 2
    m.pinPad.translation = [ pcenterx, pcentery ]

    m.pinPad.setFocus(true)

end sub

sub initMetButtons()
    m.pinPadLabel.visible = false
    m.tempo.visible = true
    m.pinPad.visible = false
    m.metronomeButtons.visible = true

    rect = m.metronomeButtons.boundingRect()
    centerx = (1920 - rect.width) / 2
    centery = (720 - rect.height) / 2
    m.metronomeButtons.translation = [ centerx, centery ]

    m.metronomeButtons.setFocus(true)

end sub

sub metButtonPressed()
    m.buttonSelected = m.metronomeButtons.getChild(m.metronomeButtons.buttonSelected)
    m.buttonValue = m.buttonSelected.text

    if m.buttonValue = "-"
        m.tempoInt = strtoi(m.tempo.text)
        if m.tempoInt <> 1
            m.tempoInt = m.tempoInt - 1
            m.tempo.text = stri(m.tempoInt)
        end if
    else if m.buttonValue = "+"
        m.tempoInt = strtoi(m.tempo.text)
        if m.tempoInt <> 999
            m.tempoInt = m.tempoInt + 1
            m.tempo.text = stri(m.tempoInt)
        end if
    else if m.buttonValue = "Keyboard"
        initPinPad()
    else if m.buttonValue = "Start/Stop"
        if m.clickTimer.control = "stop"
            m.msTempo = 60 / m.tempoInt
            m.clickTimer.duration = m.msTempo
            m.clickTimer.control = "start"
        else if m.clickTimer.control = "start"
            m.clickTimer.control = "stop"
        end if
    end if

end sub

sub metClick()
    m.click.control = "play"
end sub

sub init()
    m.top.backExitsScene = false
    m.top.setFocus(true)
    m.top.backgroundUri = ""
    m.top.backgroundColor = "0x80000000"
    
    m.click = m.top.findNode("click")
    m.tempo = m.top.findNode("tempo")
    m.pinPadLabel = m.top.findNode("pinPadLabel")
    m.pinPad = m.top.findNode("pinPad")
    m.clickTimer = m.top.findNode("clickTimer")

    m.pinPad.visible = false

    m.pinPadLabel.visible = false

    m.metronomeButtons = m.top.findNode("metronomeButtons")

    m.metronomeButtons.buttons = [ "-", "Start/Stop", "+", "Keyboard" ]

    m.metronomeButtons.observeField("buttonSelected", "metButtonPressed")

    m.clickTimer.observeField("fire", "metClick")

    m.tempoInt = 140

    initMetButtons()

End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press then 
        if key = "back"
            if m.pinPad.visible = true
                if m.pinPad.pin = "000"
                    m.pinPad.pin = "001"
                end if
                m.tempo.text = m.pinPad.pin
                m.tempoInt = strtoi(m.tempo.text)
                initMetButtons()
            end if
        else if key = "play"
            if m.clickTimer.control = "stop"
                m.msTempo = 60 / m.tempoInt
                m.clickTimer.duration = m.msTempo
                m.clickTimer.control = "start"
            else if m.clickTimer.control = "start"
                m.clickTimer.control = "stop"
            end if
        end if
    end if
    
    return result 
end function