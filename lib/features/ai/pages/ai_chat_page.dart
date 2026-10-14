import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/chat/ai_chat_input_bar.dart';
import '../widgets/chat/chat_context_anchor.dart';
import '../widgets/chat/chat_message_bubble.dart';
import '../widgets/chat/chat_tool_call_card.dart';

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.auto_awesome_rounded, color: AppTheme.aiPurple, size: 18),
            const SizedBox(width: 8),
            const Text('408 动态教练', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w800)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline_rounded, color: AppTheme.textSecondary)),
        ],
      ),
      body: Column(
        children: [
          // Global Context Banner Mock
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: AppTheme.aiPurple.withValues(alpha: 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.link_rounded, size: 14, color: AppTheme.aiPurple.withValues(alpha: 0.8)),
                const SizedBox(width: 4),
                Text(
                  '已挂载知识图谱及您的近期错题履历',
                  style: TextStyle(fontSize: 11, color: AppTheme.aiPurple.withValues(alpha: 0.8), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const ChatMessageBubble(
                  text: '晚上好！我看你刚刚在 OS 的管程部分做错了两道题，有什么我可以帮你的吗？',
                  isUser: false,
                ),
                const SizedBox(height: 16),
                
                // User Message with Context Anchor
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const ChatContextAnchor(
                      title: '错题引用',
                      subtitle: '管程内的信号量机制用于...',
                      icon: Icons.edit_document,
                    ),
                    const ChatMessageBubble(
                      text: '我还是不懂管程怎么做到互斥的，能不能给我打个比方？',
                      isUser: true,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // AI Response
                const ChatMessageBubble(
                  text: '好问题！你把【管程】想象成一个带电子锁的“高档公厕”（共享资源）。\n\n【互斥】就是这个厕所一次只能进一个人，只要有人在里面，外面的人就必须排队。这就叫系统自动保证的互斥，不需要你在里面自己锁门（不需要手动做 P/V 操作）。\n\n而【条件变量/信号量】则是：你进去了，发现没带纸（条件不满足）。你不能占着坑位不拉屎，所以你得退出来（wait），让带纸的人进去。等你朋友来了把纸递给你（signal 唤醒），你再重新排队进去。\n\n所以，管程内自带互斥光环，内部的条件变量只管解决同步等待！',
                  isUser: false,
                ),
                const SizedBox(height: 24),

                // User triggering an action
                const ChatMessageBubble(
                  text: '听懂了！但是我今天有点累，能把剩下的 OS 任务往后延一延吗？',
                  isUser: true,
                ),
                const SizedBox(height: 16),

                // Tool Call Card Rendered by AI
                const ChatMessageBubble(
                  text: '没问题，我已经为你重新做好了调度推演：为了保住明天的重要进度，我将 2 个 NICE 任务推去了周末。',
                  isUser: false,
                ),
                const ChatToolCallCard(
                  actionName: '计划重排就绪',
                  details: '将 "OS死锁练习" 与 "计网物理层复习" 顺延至周六。今日剩余 1 个 MUST 任务。',
                  icon: Icons.calendar_month_rounded,
                ),
              ],
            ),
          ),
          const AiChatInputBar(),
        ],
      ),
    );
  }
}
