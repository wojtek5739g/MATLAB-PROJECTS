function Ranges = RangeMaker(range)
    % range - początkowy przedział
    % Ranges - array cell z poszczególnymi przedziałami izolacji
    Ranges = {};
    Function= @(x) 0.7*x.*cos(x)-log(x+1);
    G=groupConsec(groupTrue(Function(range)>0)-groupTrue(Function(range)<0));
    [starts,stops]=groupLims(G,1)
    endpoints=sort(round((starts+stops)/2));
    xline(range(endpoints),'--');
    for i=1:length(endpoints)-1
        Ranges{end+1} = [range(endpoints(i)), range(endpoints(i+1))];
    end
end