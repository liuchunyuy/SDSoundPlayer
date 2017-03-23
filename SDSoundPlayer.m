//
//  SDSoundPlayer.m
//  A3FaceLockApp
//
//  Created by GavinHe on 2017/2/27.
//  Copyright © 2017年 Liu Chunyu. All rights reserved.
//

#import "SDSoundPlayer.h"


static SDSoundPlayer *soundplayer = nil;
@implementation SDSoundPlayer


+(SDSoundPlayer *)SDSoundPlayerInit{
    if(soundplayer == nil){
        soundplayer = [[SDSoundPlayer alloc]init];
        [soundplayer setDefaultWithVolume:-1.0 rate:-1.0 pitchMultiplier:-1.0];
    }
    return soundplayer;
    
}

//播放声音

-(void)play:(NSString *)string{
    if(string && string.length > 0){
        
        AVSpeechSynthesizer *player  = [[AVSpeechSynthesizer alloc]init];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:string];//设置语音内容
        utterance.voice  = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置语言
        utterance.rate   = self.rate;  //设置语速
        utterance.volume = self.volume;  //设置音量（0.0~1.0）默认为1.0
        utterance.pitchMultiplier    = self.pitchMultiplier;  //设置语调 (0.5-2.0)
        utterance.postUtteranceDelay = 1; //目的是让语音合成器播放下一语句前有短暂的暂停
        [player speakUtterance:utterance];
        
    }    
}

//初始化配置

/*
 *  设置播放的声音参数 如果选择默认请传入 -1.0
 *
 *  @param aVolume          音量（0.0~1.0）默认为1.0
 *  @param aRate            语速（0.0~1.0）
 *  @param aPitchMultiplier 语调 (0.5-2.0)
 */

-(void)setDefaultWithVolume:(float)aVolume rate:(CGFloat)aRate pitchMultiplier:(CGFloat)aPitchMultiplier{
    
    self.rate   = aRate;
    self.volume = aVolume;
    self.pitchMultiplier = aPitchMultiplier;
    if (aRate == -1.0) {
        self.rate = 1;
    }
    if (aVolume == -1.0) {
        self.volume = 1;
    }
    if (aPitchMultiplier == -1.0) {
        self.pitchMultiplier = 1;
    }
}


@end
