% Computes FWHM after performing fit using cftool.
% Marko Mayr, 16.12.2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

% plotcoef=(coeffvalues(fittedmodel))';
%    % amplitude
%    % position of peak
%    % FWHM
%    
% width = 2*sqrt(log(2))*plotcoef([3:3:24])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% change to folder where function fwhm is saved


f = fit(xvec',double(fitdummy),'gauss8');
%plot(f,xvec,fitdummy)


fit_coef = coeffvalues(f);
for n=1:24
    a(n)=fit_coef(n);
end

fit_func = @(x) a(1)*exp(-((x-a(2))/a(3))^2) + a(4)*exp(-((x-a(5))/a(6))^2) + a(7)*exp(-((x-a(8))/a(9))^2) + a(10)*exp(-((x-a(11))/a(12))^2) + a(13)*exp(-((x-a(14))/a(15))^2) + a(16)*exp(-((x-a(17))/a(18))^2) + a(19)*exp(-((x-a(20))/a(21))^2) + a(22)*exp(-((x-a(23))/a(24))^2);

for k=1:xend-xstart
    ff(k) = feval(fit_func,xvec(k));
end

peak1_max = max(ff);
    peak1_fwhm = fwhm( xend-xstart:xend, ff);
        peak1_xindex = find(ff == peak1_max,1,'first');
    peak1_xval = xstart + peak1_xindex;


