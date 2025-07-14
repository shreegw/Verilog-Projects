## Clock Signal
set_property PACKAGE_PIN E3 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]

## UART RX  Line
set_property PACKAGE_PIN D14 [get_ports UART_RX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_RX]

## UART TX Line
set_property PACKAGE_PIN H14 [get_ports UART_TX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TX]

## UART In Progress RED-LED indicator
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { uartip }];

## Key Ready GREEN-LED indicator
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { keyready }];

## Key Register status
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { regisfull }];

## Reset Switch to clear received data
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { reset}];


## ENC Register status
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { encryptionready }];

## DEC Register status
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { decryptionready }];
