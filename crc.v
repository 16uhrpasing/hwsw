module crc  ( input reg [8:0] msg,
              input reg [3:0] genpoly,
              input reg [3:0] innull,
              output reg [3:0] crcout);


   wire firstout, secondout, thirdout, fourthout, fifthout;


   xormux first(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(msg(8)),
                    .xorinput(msg[8:5])
                    .xoroutput(firstout));

    
    xormux second(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(firstout(2)),
                    .xorinput({firstout(2:0), msg(4)})
                    .xoroutput(secondout));

    xormux third(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(secondout(2)),
                    .xorinput({secondout(2:0), msg(3)})
                    .xoroutput(thirdout));

    xormux fourth(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(thirdout(2)),
                    .xorinput({thirdout(2:0), msg(2)})
                    .xoroutput(fourthout));

    xormux fifth(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(fourthout(2)),
                    .xorinput({fourthout(2:0), msg(1)})
                    .xoroutput(fifthout));


    xormux sixth(.inmuxpoly(genpoly),
                    .inmuxnull(innull),
                    .inmuxsel(fifthout(2)),
                    .xorinput({fifthout(2:0), msg(0)})
                    .xoroutput(crcout));

        

endmodule