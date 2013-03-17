class Particle 
{
  float cx, cy;
  float tx, ty;
  int intensity;
  float speed = 0;
  boolean targetRechead = false;

  Particle (float cx, float cy, float tx, float ty, int intensity)
  {
    this.cx = cx;
    this.cy = cy;
    this.tx = tx;
    this.ty = ty;
    this.intensity = intensity;
  }

  void draw ()
  {
    point (cx, cy);
  }
}

class PointCloud 
{
  boolean paused = false;
  Particle [] p;
  float [] [] pp;
  int [][] myLinks;
  int length;
  Delaunay dl;
  int [] intensities;

  PointCloud (int n)
  {
    this.length = n;
    p = new Particle [0];
    pp = new float [0] [0];
    myLinks = new int [0] [0];
    intensities = new int [0];
  }


  void addParticel (Particle cp)
  {
    if (p.length <= length) {
      
      p = (Particle[]) append (p, cp);
      pp = (float [] []) append (pp, new float [] {
        p[p.length-1].cx, 
        p[p.length-1].cy
      }
      );
      intensities = (int []) append (intensities,p[p.length-1].intensity);
    }
  }


  void draw ()
  {

    dl = new Delaunay (pp);
    myLinks = dl.getLinks();

    for (int i=0; i<myLinks.length; i++)
    {    
      	int startIndex = myLinks[i][0];
      	int endIndex = myLinks[i][1];
      
      	float startX = pp[startIndex][0];
      	float startY = pp[startIndex][1];
      	float endX = pp[endIndex][0];
      	float endY = pp[endIndex][1];
        int intensity = intensities[startIndex];
        //stroke(intensity*2.1,intensity*1.6,10,120);
        stroke(intensity*2.1,intensity*1.6,167,120);
      	line( startX, startY, endX, endY );  
    }
  }
}


