% Finds local values of amplified seed pulse, ...
% ... creates an envelope function and fits a gaussian to it. 
% Then computes and finally plots the peak values and FWHM. 
% Marko Mayr, 26.12.2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
clear;

cd 'C:\Users\Marko\Documents\Oxford\SCARF simulations\FWHM'

file_begin = 320;
number_files = 400;
%a0 = 0.0356;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
for i = file_begin:number_files 
    cd 'C:\Users\Marko\Documents\Oxford\SCARF simulations\20122017\1\MS\FLD\ene_emf'

    name = sprintf('ene_emf-%.6d.h5', i); 
    
        dummy = h5read(name,'/ene_emf');
        ydummy = envelope(dummy,5,'peak');
        maxdummy = max(ydummy);
        indexdummy = find(ydummy == maxdummy,1,'first');
    
    xstart = indexdummy - 3000;
    xend = indexdummy + 3000;
    
    %where is plot_envelope.m and getFWHM.m saved?
    cd 'C:\Users\Marko\Documents\Oxford\SCARF simulations\FWHM'
    plot_envelope;
    getFWHM;
    
    fwhm_1(i) = peak1_fwhm;
    y_1(i) = peak1_max;
    x_1(i) = peak1_xval;
     
    fprintf('Now at file %d.\n',i);
end

subplot(2,1,1);
plot(1:number_files,y_1);
ylabel('peak value of seed');
subplot(2,1,2);
plot(1:number_files,fwhm_1);
xlabel('file number or time');
ylabel('FWHM');

%cftool; 
    % /* now perform fit and return 'fittedmodel' */

