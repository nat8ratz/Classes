function [Kt, Kts] = KtCalc(Dd, rd,KtTable)
    A = KtTable.data(Dd,2);
    b = KtTable.data(Dd,3);
    As = KtTable.data(Dd,4);
    bs = KtTable.data(Dd,5);
    Kt = A*rd^b;
    Kts = As*rd^bs;
end
