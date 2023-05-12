program main
  use FMLL
  implicit none

  integer, parameter :: num_inputs = 2, num_hidden = 4, num_outputs = 1
  integer :: num_layers, i
  real :: inputs(num_inputs), targets(num_outputs)
  type(network_type) :: net

  ! ニューラルネットワークの設定
  num_layers = 2
  allocate(net%layers(num_layers))
  net%layers(1) = layer(num_inputs, num_hidden, 'tanh')
  net%layers(2) = layer(num_hidden, num_outputs, 'sigmoid')
  call net%init()

  ! 入力データの設定
  inputs = [1.0, 2.0]
  targets = [0.5]

  ! ニューラルネットワークの学習
  call net%train(inputs, targets)

  ! ニューラルネットワークの予測
  print *, "Prediction:", net%predict(inputs)

end program main
