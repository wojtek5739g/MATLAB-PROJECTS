
Function= @(x) 0.7*x.*cos(x)-log(x+1);
range=2:0.001:11;
G=groupConsec(groupTrue(Function(range)>0)-groupTrue(Function(range)<0));
[starts,stops]=groupLims(G,1)
endpoints=sort(round((starts+stops)/2))
plot(range,Function(range)); 
xline(range(endpoints),'--')