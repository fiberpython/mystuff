for (var i=0; i<1000; i++) 
{ names=["exam", "essay", "quiz"];
for (var j=0; j<3; j++) {db.scores.insert( { "student": i, "type": names[j], score : Math.round(Math.random()*100) });}}
