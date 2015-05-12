/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Popover() {
    var showPopover = function () {
        $(this).popover('show');
    }
    , hidePopover = function () {
        $(this).popover('hide');
    };

    $('.ms').popover({
        content: 'Un.: ms',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.kHz').popover({
        content: 'Un.: kHz',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.MHz').popover({
        content: 'Un.: MHz',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.Temperature').popover({
        content: 'Un.: Celsius',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.Humidity').popover({
        content: 'Un.: %',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.dBm').popover({
        content: 'Un.: dBm',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.dB').popover({
        content: 'Un.: dB',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.mA').popover({
        content: 'Un.: mA',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.V').popover({
        content: 'Un.: V',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.mV').popover({
        content: 'Un.: mV',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.kV').popover({
        content: 'Un.: kV',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.inHg').popover({
        content: 'Un.: inHg',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.s').popover({
        content: 'Un.: s',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.ciclo').popover({
        content: 'Un.: ciclo(s)',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);
    $('.Vrms').popover({
        content: 'Un.: Vrms',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);

    $('.Grau').popover({
        content: 'Un.: Graus',
        trigger: 'manual',
        placement: 'top'
    })
              .focus(showPopover)
              .focusout(hidePopover);

}
$(Popover());

