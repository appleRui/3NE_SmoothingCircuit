PI = Math::PI #円周率
OMEGA = 2*50*PI.ceil(3)　#ω
C = 0.00068　#コンデンサ容量
VMAX = 100*Math.sqrt(2).ceil(3)　#最大電圧
DELTA = 0.001　#微小な幅

for r in [30,40,50,60,70,80,90,100,110,120,130,140] do #for文により抵抗の範囲でループさせる
    theta_11 = 0 #θ１の初期化
    theta_2 = PI - Math.atan(OMEGA*C*r)　#θ２の計算
    theta_12 = theta_2　#θ１２にθ２を代入する
    y = Math.exp(-(PI+theta_11-theta_2)/(OMEGA*C*r))*Math.sin(theta_2)-Math.sin(theta_11)　#y=f(0)の計算

    while (theta_11-theta_12).abs > DELTA do　#（θ１ーθ２）の絶対値が微小な幅δDELTAより大きい時にループさせる
        theta_m = (theta_11+theta_12)/2 #区間[θ1,θ2]の中点θmを計算する。
        ym = Math.exp(-(PI+theta_11-theta_2)/(OMEGA*C*r))*Math.sin(theta_2)-Math.sin(theta_m) #中点の時のy=f(θm)
        if (y*ym) > 0 #もし、y=f(0)×y=f(θm)が０より大きい時次の処理をする
            theta_11 = theta_m #θmをθ1に代入する
        else #falseの時
            theta_12 = theta_m　#θmをθ12に代入する
        end
        　theta_11 = theta_m　#θmをθ11に代入する
    end 
    p "R=#{r}, θ1=#{sprintf("%.3f", theta_11)}, θ2=#{sprintf("%.3f", theta_2)}"　#各抵抗の時のθ１、θ２の実行結果
end