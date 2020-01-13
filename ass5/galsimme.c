#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "graphics.h"
#include <time.h>

const float circleRadius=0.0025, circleColor=0,recCol = 0.6;
const int windowWidth=800;
const float L=1, W=1;
const double eps = 0.001;
const double theta = 0.2;

//Function to read binary file
void read_doubles_from_file(int n, double* p, const char* fileName){
FILE* input_file =fopen(fileName, "rb");
//size_t fileSize=ftell(input_file);
fread(p,sizeof(double),n,input_file);
}


//Structure for the particles
typedef struct particle{
	double xpos,ypos,mass,xvel,yvel,br;
} part; 


typedef struct quadtree_t{
	struct quadtree_t *children[4];
	struct particle *part;
	double xmid,ymid,width,xcom, ycom, cMass;
	char has_children;
}quad;

void print_quadtree(quad *tree) {
	if(tree->has_children) {
		if(!tree->part) {
			printf("Root has children\n");
		} else {
			printf("Tree has children\n");
		}
		if(tree->children[0]) {
			printf("sw->\n");
			print_quadtree(tree->children[0]); //sw	
		}
		if(tree->children[1]) {
			printf("se->\n");
			print_quadtree(tree->children[1]); //se
		}
		if(tree->children[2]) {
			printf("nw->\n");
			print_quadtree(tree->children[2]); //nw
		}
		if(tree->children[3]) {
			printf("ne->\n");
			print_quadtree(tree->children[3]); //ne
		}
	} else if(tree->part){
		printf("Tree has particle\n");
		printf("Quadrants xmid: %f ymid: %f\n",tree->xmid,tree->ymid);
		printf("Particles position xpos:%f ypos:%f\n",tree->part->xpos,tree->part->ypos );
	}
}

void draw_quadtree(quad *tree) {
	if(tree->has_children) {
		if(tree->children[0]) {
			draw_quadtree(tree->children[0]); //sw
			// DrawRectangle(tree->xmid-tree->width/2, tree->ymid-tree->width/2,
		 // L, W,tree->width,tree->width, recCol);	
		}
		if(tree->children[1]) {
			draw_quadtree(tree->children[1]); //se
			// DrawRectangle(tree->xmid-tree->width/2, tree->ymid-tree->width/2,
		 // L, W,tree->width,tree->width, recCol);
		}
		if(tree->children[2]) {
			draw_quadtree(tree->children[2]); //nw
			// DrawRectangle(tree->xmid-tree->width/2, tree->ymid-tree->width/2,
		 // L, W,tree->width,tree->width, recCol);
		}
		if(tree->children[3]) {
			draw_quadtree(tree->children[3]); //ne
			// DrawRectangle(tree->xmid-tree->width/2, tree->ymid-tree->width/2,
		 // L, W,tree->width,tree->width, recCol);
		}
	} else if(tree->part){
		DrawCircle(tree->part->xpos, tree->part->ypos, L, W, circleRadius, circleColor);
		DrawRectangle(tree->xmid-tree->width/2, tree->ymid-tree->width/2,
		 L, W,tree->width,tree->width, recCol);
	}
}
void free_tree(quad *q) {
	if(q!=NULL) {
		free_tree(q->children[0]);
		free_tree(q->children[1]);
		free_tree(q->children[2]);
		free_tree(q->children[3]);
	}
	free(q);
}

//Returns the argument cubed
double cube(double x){
    return x*x*x;
}

void vel_calc(quad *tree, part *p,double G, double dt) {
	double fx,fy,rx,ry,r,s,d;
	if (tree == NULL || tree->part == p) {
		return;

	} 
	if(tree->part) {
		rx = (p->xpos - tree->part->xpos);
		ry = (p->ypos - tree->part->ypos);
		r = sqrt(rx*rx+ry*ry);

		fx = -(G*tree->part->mass*p->mass*rx)/(cube(r+eps));
		fy = -(G*tree->part->mass*p->mass*ry)/(cube(r+eps));
		// printf("fy %f\n",fy);
		// printf("fx %f\n",fx);
		// printf("yvel before: %f\n",p->yvel );
		p->xvel = p->xvel + (dt*fx/p->mass);
		p->yvel = p->yvel + (dt*fy/p->mass);
		// printf("yvel after: %f\n",p->yvel );


	}
	else {
		s = tree->width;
		d = sqrt((tree->xcom - p->xpos)*(tree->xcom - p->xpos)
			+(tree->ycom - p->ypos)*(tree->ycom - p->ypos));
		if(s/d < theta) {
			rx = (p->xpos - tree->xcom);
			ry = (p->ypos - tree->ycom);
			r = sqrt(rx*rx+ry*ry);

			fx = -(G*tree->cMass*p->mass*rx)/(cube(r+eps));
			fy = -(G*tree->cMass*p->mass*ry)/(cube(r+eps));

			p->xvel = p->xvel + (dt*fx/p->mass);
			p->yvel = p->yvel + (dt*fy/p->mass);
		}
		else {
			vel_calc(tree->children[0],p,G,dt); //sw	
			vel_calc(tree->children[1],p,G,dt); //se
			vel_calc(tree->children[2],p,G,dt); //nw
			vel_calc(tree->children[3],p,G,dt); //ne	

		}
	}
		// sqrt(pow(tree->xcom - p->xpos)+pow(tree->ycom - p->ycom));
}

quad* quad_init(double width, double xmid, double ymid){
	quad *tree=(quad*)malloc(sizeof(quad));

	for(int i=0;i<4;i++){
		tree->children[i]=NULL;
	}
	tree->width=width;
	tree->xmid = xmid;
	tree->ymid = ymid;
	tree->part=NULL;
	tree->has_children=0;
	return tree;
}


int find_quad(quad *current, part *p) {
	if (p->xpos < current->xmid) {
		if(p->ypos < current->ymid) {
			return 0;	//southwest quadrant
		} 
		else {
			return 2;	//northwest quadrant
		}
	} 
	else {
		if (p->ypos < current->ymid) {
			return 1;	//southeast quadrant
		}
		else {
			return 3;	//northeast quadrant
		}
	}
	
}
double * get_mid(double xmid, double ymid,double width, int q) {
	static double p[2];
	if(q==0) {
		p[0] = xmid-width/4;	//x-position of new middle point
		p[1] = ymid-width/4;	//y-position of new middle point
		return p;
	}
	else if(q==1) {
		p[0] = xmid+width/4;
		p[1] = ymid - width/4;
		return p;
	}
	else if(q==2) {
		p[0] = xmid-width/4;
		p[1] = ymid + width/4;
		return p;
	} else if(q==3) {
		p[0] = xmid + width/4;
		p[1] = ymid + width/4;
		return p;
	}
	return 0;
}

void add_particle(quad *tree,part *p){
	//part *newnode=malloc(sizeof(part));
	int q;
	double *mid;
	if(tree->has_children) {
		// printf("We're in the system\n");
		q = find_quad(tree,p);
		if(tree->children[q]) {
			add_particle(tree->children[q],p);
		}
		else {
			mid = get_mid(tree->xmid,tree->ymid,tree->width,q);
			// printf("New middle point: %f,%f\n", mid[0],mid[1] );
			tree->children[q] = quad_init(tree->width/2,mid[0],mid[1]);
			add_particle(tree->children[q],p);
		}
		tree->xcom = (tree->xcom*tree->cMass+p->xpos*p->mass)/
					(tree->cMass+p->mass);
		tree->ycom = (tree->ycom*tree->cMass+p->ypos*p->mass)/
					(tree->cMass+p->mass);
		tree->cMass = tree->cMass+p->mass;

	} 
	else {
		if(tree->part){
			q = find_quad(tree, tree->part);
			//q = find_quad(tree,p);
			// printf("Quadrant: %d\n",q);
			if(!tree->children[q]) {
				mid =get_mid(tree->xmid,tree->ymid,tree->width,q);
				// printf("New middle point: %f,%f\n", mid[0],mid[1] );
				tree->children[q] = quad_init(tree->width/2,mid[0],mid[1]);
			}
			add_particle(tree->children[q],tree->part);

			q = find_quad(tree, p);
			// printf("This is the quuuu %d\n",q );
			if(!tree->children[q]) {
				mid =get_mid(tree->xmid,tree->ymid,tree->width,q);
				// printf("New middle point: %f,%f\n", mid[0],mid[1] );
				tree->children[q] = quad_init(tree->width/2,mid[0],mid[1]);
			}
			add_particle(tree->children[q],p);
			tree->has_children =1;
			tree->cMass = tree->part->mass+p->mass;
			tree->xcom = (tree->part->xpos*tree->part->mass+
						p->xpos*p->mass)/tree->cMass;
			tree->ycom = (tree->part->ypos*tree->part->mass+
						p->ypos*p->mass)/tree->cMass;

			tree->part = NULL;
			//tree->com = 0;
			
		}
		else {
		tree->part = p;
		tree->xcom = p->xpos;
		tree->ycom = p->ypos;
		tree->cMass = p->mass;
		}
	}
}



int main(int argc, char const *argv[])
{
	
	const int N =atoi(argv[1]);
	const char* fileName =argv[2];
	const int graph = atoi(argv[3]);
	double dt = 0.00001;
	double buf[6*N];
	double G = (double) 100/N;
	printf("%f\n",G );

// Read particle data from file and store in particles struct.
	printf("N= %d\n", N);
	printf("fileName = '%s'\n", fileName);

	read_doubles_from_file(6*N,buf,fileName);
	
	
	part *p = malloc(N*sizeof(part));
	int k=0;
	for (int i = 0; i<6*N; i+=6) {
		// printf("=====particle %d======\n", k+1);
		p[k].xpos = buf[i];
		// printf(" xposition %f\n",p[k].xpos);
		p[k].ypos = buf[i+1];
		// printf(" yposition %f\n",p[k].ypos);
		p[k].mass = buf[i+2];
		// printf(" mass %f\n",p[k].mass);
		p[k].xvel = buf[i+3];
		// printf(" xvel %f\n",p[k].xvel);
		p[k].yvel = buf[i+4];
		// printf(" yvel %f\n",p[k].yvel);
		p[k].br = buf[i+5];
		// printf(" brightness %f\n",p[k].br);
		k+=1;
	}
	
	// FILE *fp;
	// fp = fopen("result.gal","wb");
	// for (int i=0; i<N; i++){
	// 	fwrite(&p[i].xpos, sizeof(double),1, fp);
	// 	fwrite(&p[i].ypos, sizeof(double),1, fp);
	// 	fwrite(&p[i].mass, sizeof(double),1, fp);
	// 	fwrite(&p[i].xvel, sizeof(double),1, fp);
	// 	fwrite(&p[i].yvel, sizeof(double),1, fp);
	// 	fwrite(&p[i].br, sizeof(double),1, fp);
	// }
	if (graph==1) {
		InitializeGraphics(0,windowWidth,windowWidth);
		SetCAxes(0,1);
	}
	// clock_t begin;
	// clock_t end;
	int steps = 100;
	for(int s = 1; s<steps+1;s++) {

		quad *root=NULL;
		root =quad_init(1,0.5,0.5);
		
		for (int i = 0; i<N; i++) {
			add_particle(root,&p[i]);
		}		

		// for (int i = 0; i<N; i++) {
		// 	DrawCircle(p[i].xpos,p[i].ypos,L,W,circleRadius,circleColor);
		// }
		if (graph==1) {
			draw_quadtree(root);
			Refresh();
			usleep(15000);
			ClearScreen();
		}
		// clock_t begin = clock();
		for (int i=0; i<N; i++) {
			vel_calc(root,&p[i],G,dt);
		}
		// clock_t end = clock();
		// clock_t end = clock();
		// printf("p[3] vel: %f , %f\n", p[3].xvel,p[3].yvel);
		
		for (int i=0; i<N; i++) {
			p[i].xpos = p[i].xpos +dt*p[i].xvel;
			p[i].ypos = p[i].ypos +dt*p[i].yvel;
			// DrawCircle(p[i].xpos,p[i].ypos,L,W,circleRadius,circleColor);
		}
		free_tree(root);

	}

	
	

	FILE *fp;
	fp = fopen("result.gal","wb");
	for (int i=0; i<N; i++){
		fwrite(&p[i].xpos, sizeof(double),1, fp);
		fwrite(&p[i].ypos, sizeof(double),1, fp);
		fwrite(&p[i].mass, sizeof(double),1, fp);
		fwrite(&p[i].xvel, sizeof(double),1, fp);
		fwrite(&p[i].yvel, sizeof(double),1, fp);
		fwrite(&p[i].br, sizeof(double),1, fp);
	}
	free(p);

	
// part *p1 = NULL;
// p1 = malloc(sizeof(part));
// p1->xpos = 0.3 ;
// p1->ypos = 0.3;
// p1->mass = 1;

// part *p2 = NULL;
// p2 = malloc(sizeof(part));
// p2->xpos = 0.25 ;
// p2->ypos = 0.25;
// p2->mass = 1;

// part *p3 = NULL;
// p3 = malloc(sizeof(part));
// p3->xpos = 0.7 ;
// p3->ypos = 0.7;
// p3->mass = 1;

// quad *root=NULL;
// root =quad_init(1,0.5,0.5);
// add_particle(root,p1);
// add_particle(root,p2);
// vel_calc(root,p1,G);
// vel_calc(root,p2,G);
// add_particle(root,p3);

	
	// double time_spent = (double)(end-begin)/CLOCKS_PER_SEC;
	// printf("Time spent add: %f\n",time_spent );



	return 0;
}
