// 学习模式顶层模块
`include "header.vh"

module demonlearning(
    input           clk,                    // 时钟
    input     [6:0] key,                    // 0: do, 1: re, 2: mi, 3: fa, 4: sol, 5: la, 6: si 
    input     [2:0] mode,                  
    output          speaker,                // 扬声器
    output reg [6:0] led,                    // LED
    output reg       finished,               // 歌曲是否播放完成
    output reg     right,              // 歌曲是否播放完成
    output reg [40:0] score                  // 分数
);

 
    reg  [10:0] cnt_note;
     reg [10:0] note_num;                    // 歌曲中音符的计数器
    reg  [28:0] duration;                    // 持续时间计数器
    reg  [4:0]  note;                        // 音符和当前音符
    reg  [6:0]  current;                     // 当前音符和音高
    reg  [3:0]  note_len;                    // 音符长度
    parameter   period   = `CLK;             // 音符周期
    parameter   note_dur = 11 * period / 10; // 音符持续时间

    Buzzer buzzer(.clk(clk), .mode(2'b00), .note(note), .speaker(speaker));

    initial begin
        cnt_note  = 1;
        duration  = 0;
        finished  = 0;
        score     = 0;
        note_len  = 1;
    end
  
    // 播放音符
    always @(*) begin
        if (key != current || mode != 3'b101) begin
            note = 0;
        end else begin
            case (key)
                `led1: note = 1;  // C3
                `led2: note = 2;  // D3
                `led3: note = 3;  // E3
                `led4: note = 4;  // F3
                `led5: note = 5;  // G3
                `led6: note = 6;  // A
                `led7: note = 7;  // B3
                default: note = 0;  // 休止符
            endcase
        end
    end
	always @(posedge clk) begin
        if(mode != 3'b101) begin
            note_num <= 0;
        end else begin
               note_num <= 49; 
        end
    end
    // 计数音符
    reg [31:0] slow_clk_counter;
    parameter SLOW_CLK_PERIOD = 100_000_000;
    
    always @(posedge clk) begin
        if (mode != 3'b101) begin
            duration <= 0;
            cnt_note <= 1;
            finished <= 0;
            score    <= 0;
             right<=0;
        end
           if 
                  (finished==1) begin
                  score <= score;
                  end    
        else begin
         slow_clk_counter <= slow_clk_counter + 1;
            if (slow_clk_counter == SLOW_CLK_PERIOD) begin
              // Reset the counter
              slow_clk_counter <= 0;
        if(cnt_note==note_num)begin
        finished<=1;
        cnt_note <= 66;
        end
      if (key == current ) begin
            cnt_note <= cnt_note + 1;
              right<=1;
               score<=score;
        end else begin
            cnt_note <=1;
              right<=0;
             score<=score+40'd1_000_000_000;
            end
       
    end
    end
    end

  

    // 歌谱和控制LED
    always @(cnt_note) begin
        case (cnt_note)
               6'd1:  begin current = `led5; led = `led5; note_len = 1; end
           6'd2: begin current = `led0; led = `led0; note_len = 2; end
           6'd3:  begin current = `led3; led = `led3; note_len = 1; end
           6'd4: begin current = `led0; led = `led0; note_len = 1; end
           6'd5:  begin current = `led5; led = `led5; note_len = 1; end
           6'd6: begin current = `led0; led = `led0; note_len = 1; end
           6'd7:  begin current = `led3; led = `led3; note_len = 1; end
           6'd8: begin current = `led0; led = `led0; note_len = 1; end
           6'd9:  begin current = `led5; led = `led5; note_len = 1; end
           6'd10: begin current = `led0; led = `led0; note_len = 1; end
           6'd11:  begin current = `led3; led = `led3; note_len = 1; end
           6'd12: begin current = `led0; led = `led0; note_len = 1; end
           6'd13:  begin current = `led1; led = `led1; note_len = 0.5; end
           6'd14: begin current = `led0; led = `led0; note_len = 1; end
           6'd15:  begin current = `led2; led = `led2; note_len = 1; end
           6'd16: begin current = `led0; led = `led0; note_len = 1; end
           6'd17:  begin current = `led4; led = `led4; note_len = 1; end
           6'd18: begin current = `led0; led = `led0; note_len = 1; end
           6'd19: begin current = `led3; led = `led3; note_len = 1; end
           6'd20: begin current = `led0; led = `led0; note_len = 1; end
           6'd21: begin current = `led2; led = `led2; note_len = 1; end
           6'd22: begin current = `led0; led = `led0; note_len = 1; end
           6'd23: begin current = `led5; led = `led5; note_len = 0.25; end
           6'd24: begin current = `led0; led = `led0; note_len = 1; end
           6'd25: begin current = `led0; led = `led0; note_len = 1; end
           6'd26: begin current = `led0; led = `led0; note_len = 1; end
           6'd27: begin current = `led5; led = `led5; note_len = 1; end
           6'd28: begin current = `led0; led = `led0; note_len = 1; end
           6'd29: begin current = `led3; led = `led3; note_len = 1; end
           6'd30: begin current = `led0; led = `led0; note_len = 1; end
           6'd31: begin current = `led5; led = `led5; note_len = 1; end
           6'd32: begin current = `led0; led = `led0; note_len = 1; end
           6'd33: begin current = `led3; led = `led3; note_len = 1; end
           6'd34: begin current = `led0; led = `led0; note_len = 1; end
           6'd35: begin current = `led5; led = `led5; note_len = 1; end
           6'd36: begin current = `led0; led = `led0; note_len = 1; end
           6'd37: begin current = `led3; led = `led3; note_len = 1; end
           6'd38: begin current = `led0; led = `led0; note_len = 1; end
           6'd39: begin current = `led1; led = `led1; note_len = 0.5; end
           6'd40: begin current = `led0; led = `led0; note_len = 1; end
           6'd41: begin current = `led2; led = `led2; note_len = 1; end
           6'd42: begin current = `led0; led = `led0; note_len = 1; end
           6'd43: begin current = `led4; led = `led4; note_len = 1; end
           6'd44: begin current = `led0; led = `led0; note_len = 1; end
           6'd45: begin current = `led3; led = `led3; note_len = 1; end
           6'd46: begin current = `led0; led = `led0; note_len = 1; end
           6'd47: begin current = `led2; led = `led2; note_len = 1; end
           6'd48: begin current = `led0; led = `led0; note_len = 1; end
           6'd49: begin current = `led1; led = `led1; note_len = 0.25; end
             
            default: begin current = `led0; led = `led0; note_len = 1; end
        endcase
    end

endmodule
