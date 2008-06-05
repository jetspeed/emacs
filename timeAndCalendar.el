;;时间和日历
;;启动日历被我绑定到f8上了,本来是在C-x c上的 但是这个留着吧
;显示时间，格式如下
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-format "星期%a %m月%d日%H:%M")
(setq display-time-use-mail-icon t);这个不要好像也行
(add-hook 'initial-calendar-window-hook (lambda () (toggle-truncate-lines 1)))
;;日历基本配置
;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
(setq calendar-latitude +39.9)
(setq calendar-longitude +116.4)
;;我的所在地北京
(setq calendar-location-name "Beijing")

;;打开calendar自动打开节日和生日列表,nil则不显示。
;(setq view-calendar-holidays-initially t)
(setq view-calendar-holidays-initially nil)
;;在日历中突出标记节日和生日
(setq mark-holidays-in-calendar t)
;; (setq calendar-week-start-day 1)
;;节日和生日提醒设置
;;我不过基督徒的节日、希伯来人的节日和伊斯兰教的节日。
;;我是无神论者，不过我喜欢神话，大家有兴趣也可以探讨一下，发email给我吧
;(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
;;设定一些自定义的生日和节日
;;后面那些农历节日需要每年根据日历修改
(setq general-holidays '((holiday-fixed 1 1 "元旦")
						 (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
						 (holiday-fixed 3 8 "妇女节")
						 (holiday-fixed 4 1 "愚人节")
						 (holiday-fixed 5 1 "劳动节")
						 (holiday-fixed 10 1 "国庆节")
						 (holiday-fixed 12 25 "圣诞节")
						 (holiday-fixed 4 4 "清明节")
						 (holiday-fixed 6 19 "端午节")
						 (holiday-fixed 9 28 "中秋节")
						 (holiday-float 5 0 2 "母亲节")
						 (holiday-float 6 0 3 "父亲节")
						 (holiday-float 11 4 4 "感恩节")
;生日表
						 (holiday-fixed 11 8 "龚亚莉生日")
						 (holiday-fixed 4 16 "宝宝生日")
						 (holiday-fixed 12 10 "我们的纪念日，我爱你宝贝")
))

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])