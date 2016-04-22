%++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%STEPHEN JHUN
%ECE491
%Hodgkin-Huxley Equation Solver
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clear all

%==========================
%PARAMETERS
%==========================
ci_Na   = 50;
co_Na   = 491; 
ci_Ca   = 11*10^(-5);
co_Ca   = 44;
ci_K    = 400;
co_K    = 20.11;
C_m     = 10^(-3);
V_L     = -49;
T_c     = 20;
g_Na    = 120*10^(-3);
g_K     = 36*10^(-3);
g_L     = 0.3*10^(-3);
d_V_Ca  = 0.03335*(T_c+273.16)*(log(co_Ca/ci_Ca)-12.995);
V_Na    = 0.08616*(T_c+273.16)*log(co_Na/ci_Na); 
V_K     = 0.08616*(T_c+273.16)*log(co_K/ci_K);
K_T     = 3^((T_c-6.3)/10); 
a       = 238*10^(-4);
R       = 35.4;
ro     = 0;
ri     = R/(pi*a^2); 
%===================================
%CHOOSE TIME AND DISTANCE
%===================================
time      = 5; 
lngth     = 5;
del_t     = .01;  
time_step = time/del_t;              
del_dist  = .01;                 
d_step    = lngth/del_dist;             
%====================================
%CHOOSE STIMULI PROPERTIES -NN represents duration
%====================================
Stim = zeros(d_step,time_step);
   for NN = 1:1:10
   Stim(1,NN)=10;
   end

%====================================
%MATRICES for conductances G's , m,n,h, and v
%====================================
mat_G_Na = zeros(d_step, time_step); 
mat_G_K  = zeros(d_step, time_step); 
mat_G_L  = ones(d_step, time_step)*g_L; 
mat_m    = zeros(d_step, time_step);
mat_h    = zeros(d_step, time_step);
mat_n    = zeros(d_step, time_step);
mat_v    = zeros(d_step, time_step); 
%====================================
%INITIAL VALUES
%====================================

%Approximate the resting voltage Nernst
V =  -60.4029; 
Rest_V = 0.08616*(T_c+273.16)*log(co_K/ci_K)*.8;
mat_v(:,1)    = V;
alpha_m   = (-.1)*(35+mat_v(:,1)+d_V_Ca)*K_T*1./(exp(-.1*(35+mat_v(:,1)+d_V_Ca))-1);
beta_m    = 4*exp(-(60+mat_v(:,1)+d_V_Ca)/18)*K_T;
alpha_h   = 0.07*K_T*exp(-.05*(60+mat_v(:,1)+d_V_Ca));
beta_h    = K_T./(1+ exp(-.1*(30+mat_v(:,1)+d_V_Ca)));
alpha_n   = -.01*K_T*(50+mat_v(:,1)+d_V_Ca)./(exp(-.1*(50+mat_v(:,1)+d_V_Ca))-1);
beta_n    =.125*K_T*exp(-.0125*(60+mat_v(:,1)+d_V_Ca));
t_m       = 1./(alpha_m+beta_m);
t_h       = 1./(alpha_h+beta_h);
t_n       = 1./(alpha_n+beta_n);
inf_m     = alpha_m./(alpha_m+beta_m);
inf_h     = alpha_h./(alpha_h+beta_h);
inf_n     = alpha_n./(alpha_n+beta_n);
mat_m(:,1) = inf_m;
mat_n(:,1) = inf_n;
mat_h(:,1) = inf_h;

%====================================
%TRIDIAGONAL MATRICES
%Matrices are split up so that properties can be varied
%within the matrix.
%====================================

eta1          = del_t/(2*pi*a*(ro+ri)*((del_dist)^2)*C_m);
squiggle     = del_t/C_m;
for MAINS =1:1:d_step/4
    r_o          = 0;
    r_i          = ri;
    eta2          = del_t/(2*pi*a*(r_o+r_i)*((del_dist)^2)*C_m);
    mains(MAINS) = (1+2*eta2);
    if MAINS<d_step 
    lefts(MAINS)         = -eta2;
    rights(MAINS)        = -eta2;
    end
end
for MAINS =(d_step/4)+1:1:d_step/2
    r_o          = 0;
    r_i          = ri;
    eta3          = del_t/(2*pi*a*(r_o+r_i)*((del_dist)^2)*C_m);
    mains(MAINS) = (1+2*eta3);
    if MAINS<d_step  
    lefts(MAINS)         = -eta3;
    rights(MAINS)        = -eta3;
    end
end
for MAINS =(d_step/2)+1:1:d_step
    r_o          = 0;
    r_i          = ri;
    eta4          = del_t/(2*pi*a*(r_o+r_i)*((del_dist)^2)*C_m);
    mains(MAINS) = (1+2*eta4);
    if MAINS<d_step
    lefts(MAINS)         = -eta4;
    rights(MAINS)        = -eta4;
    end
end
 main =mains';
 right=rights';
 left = lefts';
 maindiag     = diag(main);
 leftdiag     = diag(left,-1);
 rightdiag    = diag(right,1);
 mat_tri      = maindiag+leftdiag+rightdiag;
 mat_tri(1,1) = mat_tri(1,1)-eta2;
 mat_tri(d_step,d_step) = mat_tri(d_step,d_step)-eta4;
 inv_mat_tri  = inv(mat_tri);

%====================================
%TRIDIAGONAL SOLUTION BY ITERATION
%====================================
 %Since we are solving for forward time, it is convenient to start
 %with 2 instead of 1
column=2; 
while column<=time_step
%*********************************************    
%Maintain Boundary Conditions during Iteration 
%*********************************************
   mat_v(1)          = mat_v(2);     
   mat_v(d_step)     = mat_v(d_step-1);
   v_col  = mat_v(:,column-1);
   m_col  = mat_m(:,column-1);
   n_col  = mat_n(:,column-1);
   h_col  = mat_h(:,column-1);
   %vc, mc, nc, and hc represent the error in calculation
   vc     = 0; 
   mc     = 0; 
   nc     = 0; 
   hc     = 0;  
   converge=0;
   while (converge == 0)
       %calculating conductance equations and current equations
      alpha_n   = -.01*(50+d_V_Ca+v_col)*K_T*1./(exp(-0.1*(50+d_V_Ca+v_col))-1);
      beta_n    = 0.125*exp(-0.0125*(v_col+d_V_Ca+60))*K_T*1;
      alpha_m   = -.1*(35+d_V_Ca+v_col)*K_T*1./(exp(-0.1*(35+d_V_Ca+v_col))-1);
      beta_m    = 4*exp(-(v_col+d_V_Ca+60)/18)*K_T;
      alpha_h   = 0.07*exp(-0.05*(v_col+d_V_Ca+60))*K_T*1;
      beta_h    = K_T * 1./(1+exp(-0.1*(v_col+d_V_Ca+30)));
      t_n       = 1./(alpha_n+beta_n);
      t_m       = 1./(alpha_m+beta_m);
      t_h       = 1./(alpha_h+beta_h);
      inf_n     = alpha_n.*t_n;
      inf_h     = alpha_h.*t_h; 
      inf_m     = alpha_m.*t_m; 
      mat_m(:,column)    = (mat_m(:, column-1)+del_t.*alpha_m)./(1+del_t.*(alpha_m+beta_m));
      mat_h(:,column)    = (mat_h(:, column-1)+del_t.*alpha_h)./(1+del_t.*(alpha_h+beta_h));
      mat_n(:,column)    = (mat_n(:, column-1)+del_t.*alpha_n)./(1+del_t.*(alpha_n+beta_n));
      mat_G_Na(:,column) = g_Na.*mat_m(:,column).^3.*mat_h(:,column);
      mat_G_K(:,column)  = g_K.*mat_n(:,column).^4;
      JNa                = mat_G_Na(:,column).*(mat_v(:,column-1)-V_Na);
      JK                 = mat_G_K(:,column).*(mat_v(:,column-1)-V_K);
      JL                 = mat_G_L(:,column).*(mat_v(:,column-1)-V_L);
      Jion               = JNa + JK + JL;
      %solving for the next time-step value of v
      V_next             = inv_mat_tri*(mat_v(:,column-1)-(squiggle)*(Jion-Stim(:,column)));
      mat_v(1)          = mat_v(2);     
      mat_v(d_step)     = mat_v(d_step-1);
      %====================================
      %CONVERGENCE CHECKING
      %====================================
      if (vc==abs(V_next-v_col)) & (mc==abs(mat_m(:,column)-m_col)) & (nc==abs(mat_n(:,column)-n_col)) & (hc==abs(mat_h(:,column)-h_col))
          %if the error margins converged, then proceed in calculating
          %the next time step value of Vm
          mat_v(:,column) = V_next;
          converge        = 1;
      else
         %if the error margins have not yet converged,
          %update the error margin values and recalculate 
         vc     =abs(V_next-v_col);
         mc     =abs(mat_m(:,column)-m_col); 
         nc     =abs(mat_n(:,column)-n_col); 
         hc     =abs(mat_h(:,column)-h_col);
         m_col  = mat_m(:,column);
         n_col  = mat_n(:,column);
         h_col  = mat_h(:,column);
      end
   end
   column = column+1;
end

%====================================
%Calculating Velocity
%====================================
%wisely choose a start and end point where the AP doesn't fail
start_d  = d_step/4;
end_d    = d_step/2.5;
v1       = mat_v(start_d,:);
v2       = mat_v(end_d,:);
%find the peak values
start    = find(v1 == max(v1));
ending   = find(v2 == max(v2));
%divide by time elapsed and normalize to units of ms
velocity = 10*max((end_d-start_d)*(del_dist)*(1/(ending-start)*(1/del_t)))


%====================================
%LOOP PLOTS - GHETTO ANIMATION
%====================================
fig = figure(1);
set(fig,'DoubleBuffer','on');
set(gca,'xlim',[0 lngth],'ylim',[-80 70],...
'NextPlot','replace','Visible','off')
%creating an avi file
% mov = avifile('EXAMPLE_PROP.avi', 'fps',30,'quality',100);
for moo = 1:1:time_step
    figure(1)
    plot_v = mat_v(:,moo);
    for loope = 1:1:length((plot_v));
      plot_v_1(loope) = plot_v(loope); 
    end
    plot([del_dist:del_dist:lngth],plot_v_1,'linewidth',3)
     xlabel('Distance into Membrane (Millimeters)')
     ylabel('Membrane Potential (Millivolts)')
     title('Action Potential Propagation (20 degrees Celsius)')
     text(lngth-4,max(v1)+10,['VELOCITY:' num2str(velocity,10) 'm/s    TIME: ' num2str(del_t*moo,10) 'ms' ],...
    'HorizontalAlignment','left')
%viewable axis depends on amplitude of action potential and length of
%membrane
    axis([0 lngth min(v1)-10 max(v1)+20])
%     F = getframe(fig);
%     mov = addframe(mov,F);
    drawnow  
end
% mov = close(mov);

%====================================
%END
%====================================


%plot([1:1:27/.1+1],vel);