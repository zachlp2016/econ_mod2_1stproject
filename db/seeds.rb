Economist.destroy_all


@johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Lord_Keynes.jpg")
@friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Friedrich_Hayek_portrait.jpg")
@karlmarx = Economist.create(name: "Karl Marx", age: "deceased", city: "Trier", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Karl_Marx_001.jpg/1024px-Karl_Marx_001.jpg")
@benbernanke = Economist.create(name: "Ben Bernanke", age: "65", city: "Augusta", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Ben_Bernanke_official_portrait.jpg/1024px-Ben_Bernanke_official_portrait.jpg")
@janetyellen = Economist.create(name: "Janet Yellen", age: "72", city: "New York City", img_url: "https://upload.wikimedia.org/wikipedia/commons/f/f4/Janet_Yellen_official_Federal_Reserve_portrait.jpg")
@miltonfriedman = Economist.create(name: "Milton Friedman", age: "94", city: "San Francisco", img_url: "https://upload.wikimedia.org/wikipedia/commons/2/20/Portrait_of_Milton_Friedman.jpg")

@johnmkeynes.papers.create(name: "The General Theory of Employment, Interest, and Money", pages: 472)
@johnmkeynes.papers.create(name:  "The Economic Consequences of the Peace", pages: 333)
@johnmkeynes.papers.create(name:  "A Treatise on Money", pages: 428)
@friedrichhayek.papers.create(name:  "The Use of Knowledge in Society", pages: 280)
@friedrichhayek.papers.create(name:  "New Individualist Review", pages: 322)
@friedrichhayek.papers.create(name:  "Economics as a Coordination Problem: The Contributions of Friedrich A. Hayek", pages: 366)
