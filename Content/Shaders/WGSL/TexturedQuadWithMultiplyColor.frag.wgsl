// Fragment shader
@group(2) @binding(0) var TextureInput: texture_2d<f32>;
@group(2) @binding(1) var Sampler: sampler;


struct UniformBlock {
    multiply_color: vec4<f32>
};
@group(3) @binding(0) var<uniform> uniforms: UniformBlock;

struct VertexOutput {
    @location(0) tex_coord: vec2<f32>,
    @builtin(position) position: vec4<f32>
};

@fragment
fn main(in: VertexOutput) -> @location(0) vec4<f32> {
    return uniforms.multiply_color * textureSample(TextureInput, Sampler, in.tex_coord);
}
