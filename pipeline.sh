
rfifind -ncpus 20 -o RFI -noweights -noscales -nooffsets -zerodm -rfips -time 1.0 *.fil 

# DDplan.py -o DDplan_down2 -l 185 -d 195 -f 148.92578125 -b 78.125 -n 3200 -c 189.4 -t 0.00016384 -s 320 -r 0.5
# DDplan.py -o DDplan_down60 -l 185 -d 195 -f 148.92578125 -b 78.125 -n 3200 -c 189.4 -t 0.00016384 -s 320 -r 15

mkdir down2
mkdir down60

bash pipeline/parallel.sh pipeline/prepsubband_launcher.txt 21 

cd down2
mv dat*/* .
rm -r dat*
single_pulse_search.py -t 6 -b *.dat
mv *singlepulse.ps ../singlepulse_down2.ps
cd ..

cd down60
single_pulse_search.py -t 6 -b *.dat
mv *singlepulse.ps ../singlepulse_down60.ps
cd ..


