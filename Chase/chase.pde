//dogs chase cars. Inspired by Daniel Shiffman's example.

int pairs = 10;
ArrayList<Car> cars;
ArrayList<Chased> dogs;

void setup() {
  size(600, 600);
  noStroke();
  cars = new ArrayList<Car>();
  dogs = new ArrayList<Chased>();
  for (int i = 0; i < pairs; i++) {
    cars.add(new Car(width/2, height/2));
    dogs.add(new Chased());
  }
}
void draw() {
  background(255);
  Chased p = dogs.get(0);
  p.r = 50;
  println();
  for (Chased c : dogs) {
    c.update();
    c.display();
    for (int i = 0; i < pairs; i++) {
      Car b = cars.get(i);
      Chased d = dogs.get(i);
      b.follow(d.loc);
      b.arrive(d.loc);
    }
  }
  for (Car c : cars) {
    c.update(); 
    c.display();
  }
}