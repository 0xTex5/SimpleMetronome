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

sub metButtonPressed()
    m.buttonSelected = m.metronomeButtons.getChild(m.metronomeButtons.buttonSelected)
    m.buttonValue = m.buttonSelected.text
    print m.buttonValue

    if m.buttonValue = "-"
        m.tempoInt = strtoi(m.tempo.text)
        m.tempoInt = m.tempoInt - 1
        m.tempo.text = stri(m.tempoInt)
    else if m.buttonValue = "+"
        m.tempoInt = strtoi(m.tempo.text)
        m.tempoInt = m.tempoInt + 1
        m.tempo.text = stri(m.tempoInt)
    else if m.buttonValue = "Keyboard"
        initPinPad()
    else if m.buttonValue = "Start/Stop"
        m.click.control = "play"
    end if

end sub

sub init()
    m.top.setFocus(true)
    m.top.backgroundUri = ""
    m.top.backgroundColor = "0x80000000"
    
    m.click = m.top.findNode("click")
    m.tempo = m.top.findNode("tempo")
    m.pinPad = m.top.findNode("pinPad")

    m.pinPad.visible = false

    m.metronomeButtons = m.top.findNode("metronomeButtons")

    m.metronomeButtons.buttons = [ "-", "Start/Stop", "+", "Keyboard" ]

    m.metronomeButtons.observeField("buttonSelected", "metButtonPressed")

    initMetButtons()

End sub

'function onKeyEvent(key as String, press as Boolean) as Boolean
'    result = true
'    if press then
'        if key = "OK"
'            if m.click.state <> "playing"
'                m.click.control = "play"
'            end if
'        end if
'    end if
'    
'    return result 
'end function