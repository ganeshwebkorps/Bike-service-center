class NoticeMailer < ApplicationMailer
    
      def new_notice(notice)
        @notice = notice
        
        mail to: @notice.user.email, subject: ' New notice '
        
      end

      def new_notice_studentds(notice, students)
        @notice = notice
        @students = students
        mail to: @students.email, subject: 'New notice'
      end
    
end
