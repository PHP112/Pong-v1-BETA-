/* Note: this uses key variables, but should be coded without
 See Static Medica Quiry .pde for illustration
 Is there an algorithm that will adjust the display geometry that forces a landscape in a portrait display?
 */
void displayGeometryCheck()
{
  String displayWidthWorks = ( displayWidth>width ) ? "Width: Game On Dude" : "Bruh, forced width" ;
  String displayHeightWorks = ( displayHeight>=height ) ? "Height: Game On Dude" : "Bruh, forced height" ;
  String orientiation = ( width>=height ) ? weGo() : adjustScreen() ;
  println(displayWidthWorks, "\t\t", displayHeightWorks, "\t\t", orientiation);
}//End displayGeometryCheck

String weGo()
{
  geometryCheck = true;
  loop();
  return "Landscape: Game On Dude";
}//End weGo

String adjustScreen()
{
  noLoop(); //will need to reactive with loop() in draw()
  return "Bruh, rotate phun";
  // Built in bug, do not use this code in deployment, issue is weGo() & noLoop() algorithm
}//End adjustScreen()
