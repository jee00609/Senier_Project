# Senier_Project

## Unit

1. 이미지 Rekognition CLI 환경에서 테스팅 완료 -> 버튼을 구현 안함
2. 이미지 업로드 테스팅 완료
3. 오디오 업로드 테스팅 완료
4. ETRI API 오디오 테스팅 완료
5. 이미지 올린 후 Rekognition 을 통해 얻은 값 index 에 보이기 
6. 업로드할 이미지의 프리뷰 보이기

## 해야할 일

1. 오디오가 저장되는데 저장 디렉토리를 변경시켜야 한다

2. Rekognition 으로 얻은 값을 Card 안에 추가하여 생성하기
   * Rekognition 을 통해 얻은 Object 들을 Card 형태로 까진 생성 완료함 (2021-09-03)
   * 이미지 각각 마다 Rekognition 을 통해 얻은 Object를 가져오면서 랜덤으로 3종류의 색 중 하나를 골라 카드 색을 바꾼다 (2021-09-12)


## 참고 이미지

* 이미지 올린 후 Rekognition 을 통해 얻은 값 index 에 보이기 

![rekognition](https://user-images.githubusercontent.com/31675804/131493311-cc84baea-0e77-4e0f-982c-bfbdebe7f0f1.png)

* 업로드할 이미지의 프리뷰 보이기

![upload Image Preview](https://user-images.githubusercontent.com/31675804/131618629-5968d163-f6ea-4bf8-851b-2e71ced017c8.png)

* Card UI

![Card](https://user-images.githubusercontent.com/31675804/131831160-cb8b9fcd-0ef2-4900-acca-2da6ca9c047b.gif)

* 이미지마다 동적으로 카드 값과 색이 출력된다.

![Card Dynamic Change](https://user-images.githubusercontent.com/31675804/132990451-6b1ae90c-576a-4a29-8ab8-fa310e19620c.gif)
