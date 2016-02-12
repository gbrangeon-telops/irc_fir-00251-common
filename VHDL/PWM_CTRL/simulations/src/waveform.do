onerror { resume }
transcript off
add wave -noreg -logic {/fan_tb/U1/CLK100}
add wave -noreg -logic {/fan_tb/U1/CLK20}
add wave -noreg -logic {/fan_tb/U1/ARESET}
add wave -noreg -hexadecimal -literal {/fan_tb/U1/AXIL_MOSI}
add wave -noreg -hexadecimal -literal {/fan_tb/U1/AXIL_MISO}
add wave -named_row "FAN_CTRL"
add wave -noreg -hexadecimal -literal {/fan_tb/U2/fan_ctrl_inst/DATA_OUT0}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/fan_ctrl_inst/DATA_OUT1}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/fan_ctrl_inst/DATA_OUT2}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/fan_ctrl_inst/DATA_OUT3}
add wave -named_row "PWM0"
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/DATA}
add wave -noreg -logic {/fan_tb/U2/pwm0/PWMo}
add wave -noreg -logic {/fan_tb/U2/pwm0/ND}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/iSum}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/bDATA}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/icount}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/idata}
add wave -noreg -logic {/fan_tb/U2/pwm0/TC}
add wave -named_row "PWM1"
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/DATA}
add wave -noreg -logic {/fan_tb/U2/pwm1/PWMo}
add wave -noreg -logic {/fan_tb/U2/pwm1/ND}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/iSum}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/bDATA}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/icount}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/idata}
add wave -noreg -logic {/fan_tb/U2/pwm1/TC}
add wave -named_row "PWM2"
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/DATA}
add wave -noreg -logic {/fan_tb/U2/pwm2/PWMo}
add wave -noreg -logic {/fan_tb/U2/pwm2/ND}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/iSum}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/bDATA}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/icount}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/idata}
add wave -noreg -logic {/fan_tb/U2/pwm2/TC}
add wave -named_row "PWM"
add wave -noreg -logic {/fan_tb/U2/PWM_CLK}
add wave -noreg -logic {/fan_tb/U2/pwm0/PWMo}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm0/DATA}
add wave -noreg -logic {/fan_tb/U2/pwm1/PWMo}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm1/DATA}
add wave -noreg -logic {/fan_tb/U2/pwm2/PWMo}
add wave -noreg -hexadecimal -literal {/fan_tb/U2/pwm2/DATA}
cursor "Cursor 1" 10ms  
transcript on
