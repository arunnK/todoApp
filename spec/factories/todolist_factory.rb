FactoryGirl.define  do
	factory :todolist do
		task "Some task"
		done "false"
		duedate "2016-06-19"
	end
end