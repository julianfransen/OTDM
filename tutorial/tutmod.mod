# Example One
var PaintB; # amount of blue
var PaintG; # amount of gold
maximize profit: 10*PaintB + 15*PaintG;
subject to time: (1/40)*PaintB + (1/30)*PaintG <= 40;
subject to blue_limit: 0 <= PaintB <= 1000;
subject to gold_limit: 0 <= PaintG <= 860;
