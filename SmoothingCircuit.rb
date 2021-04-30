PI = Math::PI
OMEGA = 2*50*PI.ceil(3)
C = 0.00068
VMAX = 100*Math.sqrt(2).ceil(3)
DELTA = 0.001

for r in [30,40,50,60,70,80,90,100,110,120,130,140] do
    theta_11 = 0
    theta_2 = PI - Math.atan(OMEGA*C*r)
    theta_12 = theta_2
    y = Math.exp(-(PI+theta_11-theta_2)/(OMEGA*C*r))*Math.sin(theta_2)-Math.sin(theta_11)

    while (theta_11-theta_12).abs > DELTA do
        theta_m = (theta_11+theta_12)/2
        ym = Math.exp(-(PI+theta_11-theta_2)/(OMEGA*C*r))*Math.sin(theta_2)-Math.sin(theta_m)
        if (y*ym) > 0
            theta_11 = theta_m
        else
            theta_12 = theta_m
        end
        　theta_11 = theta_m
    end 
    p "R=#{r}, θ1=#{sprintf("%.3f", theta_11)}, θ2=#{sprintf("%.3f", theta_2)}"
end