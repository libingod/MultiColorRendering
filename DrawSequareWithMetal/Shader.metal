//
//  Shader.metal
//  MetalTestDemo1121
//
//  Created by 刘李斌 on 2017/11/21.
//  Copyright © 2017年 Brilliance. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct Constants {
    float animateBy;
};







struct VertexIn {
    float4 position [[attribute(0)]];
    float4 color [[attribute(1)]];
    float2 textureCoordinates [[attribute(2)]];
};

struct VertexOut {
    float4 position [[position]];
    float4 color;
    float2 textureCoordinates;
};


//处理顶点,进来什么就原原本本的返回什么,这里有两个参数,一个是顶点的数量,一个是顶点的ID
//第一个参数接收结构体
vertex VertexOut vertex_shader(const VertexIn vertexIn [[stage_in]]) {
    
    VertexOut vertexOut;
    vertexOut.position = vertexIn.position;
    vertexOut.color = vertexIn.color;
    
    //纹理的处理 - 出入相同
    vertexOut.textureCoordinates = vertexIn.textureCoordinates;
    
    return vertexOut;
    
    //移动
//    float4 position = float4(vertices[vertexId], 1);
//    position.x += constants.animateBy;
//    return position;
//
//    return float4(vertices[vertexId], 1);
}

//片段功能
//上色
fragment half4 fragment_shader(VertexOut vertexIn[[stage_in]]){
//    黄色
//    return half4(1,1,0,1);
    
    //返回彩色
    return half4(vertexIn.color);
    
//    //返回黑白 - 产生灰度
//    float grayColor = (vertexIn.color.r + vertexIn.color.g + vertexIn.color.b) / 3;
//    return half4(grayColor, grayColor, grayColor, 1);
}

//用来渲染图片的片段功能
fragment half4 texture_shader(VertexOut vertexIn[[stage_in]], texture2d<float> texture [[texture(0)]]) {
    //默认采样器
    constexpr sampler defaultSampler;
    float4 color = texture.sample(defaultSampler, vertexIn.textureCoordinates);
    
    return half4(color.r, color.g, color.b, 1);
}

























