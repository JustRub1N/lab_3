MATCH (n) DETACH DELETE n;

CREATE
(e1:Event {name:'French Revolution', year:1789}),
(e2:Event {name:'Christianization of Rus', year:988}),
(p1:Person {name:'Napoleon Bonaparte', born:1769}),
(p2:Person {name:'Prince Vladimir', born:958}),
(c1:Country {name:'France', continent:'Europe'}),
(c2:Country {name:'Kievan Rus', continent:'Eurasia'}),
(ep1:Epoch {name:'Middle Ages', period:'5th–15th centuries'}),
(ep2:Epoch {name:'Modern Era', period:'15th–19th centuries'});

MATCH
(e1:Event {name:'French Revolution'}),
(e2:Event {name:'Christianization of Rus'}),
(p1:Person {name:'Napoleon Bonaparte'}),
(p2:Person {name:'Prince Vladimir'}),
(c1:Country {name:'France'}),
(c2:Country {name:'Kievan Rus'}),
(ep1:Epoch {name:'Middle Ages'}),
(ep2:Epoch {name:'Modern Era'})
CREATE
(p1)-[:PARTICIPATED_IN]->(e1),
(p2)-[:PARTICIPATED_IN]->(e2),
(e1)-[:OCCURRED_IN]->(c1),
(e2)-[:OCCURRED_IN]->(c2),
(c1)-[:BELONGS_TO_EPOCH]->(ep2),
(c2)-[:BELONGS_TO_EPOCH]->(ep1);

MATCH (e:Event)-[:OCCURRED_IN]->(c:Country)-[:BELONGS_TO_EPOCH]->(ep:Epoch)
MERGE (e)-[:BELONGS_TO_EPOCH]->(ep);

MATCH (p:Person)-[:PARTICIPATED_IN]->(e:Event)-[:BELONGS_TO_EPOCH]->(ep:Epoch)
MERGE (p)-[:LIVED_IN_EPOCH]->(ep);
