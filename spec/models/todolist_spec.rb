RSpec.describe Todolist do
	let(:completed_task1) {FactoryGirl.create(:todolist, done: true)}
	let(:completed_task2) {FactoryGirl.create(:todolist, done: true)}
	let(:pending_task1) {FactoryGirl.create(:todolist)}
	let(:pending_task2) {FactoryGirl.create(:todolist)}
	let(:completed_task_list) {[completed_task1, completed_task2]}
	let(:pending_task_list) {[pending_task1, pending_task2]}

	context 'Access completed_task_list' do
		it 'should return done tasks' do
      expect(Todolist.done).to eq ([completed_task_list])
    end
	end

  context 'Access pending_task_list' do
    it 'should return pending tasks' do
      expect(Todolist.pending).to eq (pending_task_list)
    end
  end

end