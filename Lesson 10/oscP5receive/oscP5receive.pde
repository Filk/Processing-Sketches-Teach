import oscP5.*;
import netP5.*;

OscP5 oscP5;

int numeroRecebido;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12001);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
}

void draw() {
  background(0);  
  fill(255);
  ellipse(numeroRecebido,200,20,20);
}

void oscEvent(OscMessage theOscMessage) 
{
  /* check if theOscMessage has the address pattern we are looking for. */
  
  if(theOscMessage.checkAddrPattern("/test")==true) {
    /* check if the typetag is the right one. */
      /* parse theOscMessage and extract the values from the osc message arguments. */
      numeroRecebido = theOscMessage.get(0).intValue();  
      return;
  } 
}