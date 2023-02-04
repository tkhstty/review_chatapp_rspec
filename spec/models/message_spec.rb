require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの新規作成' do
    context '新規作成ができるとき' do
      it 'content、imageが両方存在すれば登録できる' do
        expect(@message).to be_valid
      end
      it 'contentが存在すれば登録できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
      it 'imageが存在すれば登録できる' do
        @message.content = ""
        expect(@message).to be_valid
      end
    end
    context '新規作成ができないとき' do
      it 'content、imageが両方存在しないと登録できない' do
        @message.content = ""
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Content can't be blank"
      end
      it 'userが紐付いていないと登録できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "User must exist"
      end
      it 'roomが紐付いていないと登録できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Room must exist"
      end
    end
  end
end
