require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合'do
      it "必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される"do
      end
    end

    context '商品の出品ができない場合'do
      it"画像を1枚つけないと出品できない"do
      end
      it"商品名がないと出品できない"do
      end
      it"商品の説明がないとと出品できない"do
      end
      it"カテゴリー欄の選択をしないとと出品できない"do
      end
      it"商品の状態欄の選択をしないとと出品できない"do
      end
      it"配送の負担欄の選択をしないとと出品できない"do
      end
      it"発送元の地域欄の選択をしないとと出品できない"do
      end
      it"発送までの日数欄の選択をしないとと出品できない"do
      end
      it"価格が無ければ出品できない"do
      end
      it"価格が300以下だと出品できない"do
      end
      it"価格が9999999以上だと出品できない"do
      end
      it"価格が全角だと出品できない"do
      end
    end
  end

end
