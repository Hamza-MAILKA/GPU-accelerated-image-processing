/* Please Write the OpenCL Kernel(s) code here*/
__kernel void flip_x_filter(__read_only image2d_t input,__write_only image2d_t output){
    const sampler_t sampler = CLK_FILTER_NEAREST |
                               CLK_NORMALIZED_COORDS_FALSE |
                               CLK_ADDRESS_CLAMP_TO_EDGE;
                              
   const int2 size = get_image_dim(input);
   int2 coord = (int2)(get_global_id(0),get_global_id(1));
  
   int width = size.x;
 
   float4 srcRGB = read_imagef(input,sampler,(int2)(width - coord.x,coord.y));
   write_imagef(output,coord,srcRGB);
  
}