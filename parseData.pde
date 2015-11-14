

//This function parses the string of serialized data
//from Arduino. It writes the X, Y, and Z data into the
//0, 1, and 1 slots of the wayveData2 array
void parseData(String s) {

  if((s.charAt(0) == '*') && (s.charAt(s.length() - 1) == '*')) {
    
    String[] splitter = split(s.substring(1,s.length() - 1), ',');
      wayveData[0] = parseInt(splitter[1]);
      wayveData[1] = parseInt(splitter[2]);
      wayveData[2] = parseInt(splitter[3]);

    }
}
