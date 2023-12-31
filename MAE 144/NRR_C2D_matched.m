function Gz = NRR_C2D_matched(Gs,h)
    % function Gz = NRR_C2D_matched(Gs,h)
    % INPUTS:  Gs --> s-domain Tf
    %           h --> timestep
    % OUTPUTS: Gz --> z-domain Tf
    % TEST:
    % compare MatLab's built-in matched function with this function
    % Gs = RR_tf([1 1],[1 10])
    % Gz = NRR_C2D_matched(Gs,1)
    % gs = tf([1 1],[1 10])
    % gz = c2d(gs,1,'matched')

    % Steps:

    % 1) move poles and zeros to z domain via z = exp(s*h)
    Gzp = RR_poly([exp(Gs.p*h)],1);
    Gzz = RR_poly([exp(Gs.z*h)],1);
    Gz = RR_tf(Gzz,Gzp);

    % 2) add zeros at z=-1 until num_order = den_order -1
    while Gz.num.n + 1 < Gz.den.n
        Gz = Gz * RR_tf([1 1]);
    end

    % 3) adjust gain
    K = RR_evaluate(Gs,0)/RR_evaluate(Gz,1);

    Gz = K * Gz;
end
