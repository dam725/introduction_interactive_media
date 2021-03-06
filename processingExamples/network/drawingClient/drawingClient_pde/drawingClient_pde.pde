import processing.net.*;
Client client;
int xPos, yPos, pxPos, pyPos;

void setup() {
  size(640, 360);
  client= new Client(this, "127.0.0.1", 5204); 
}

void draw() {
  if (xPos!=0 && yPos!=0 && pxPos!=0 && pyPos!=0) {
    line(pxPos, pyPos, xPos, yPos);
    ellipse(xPos, yPos, 5, 5);
  }
  pxPos=xPos;
  pyPos=yPos;
}

void clientEvent(Client client) {
  String coords=client.readStringUntil('\n');
  if (coords!=null) {
    int values[]=int(splitTokens(coords, ",\n"));
    xPos=values[0];
    yPos=values[1];
  }
}