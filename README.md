# raspik8s
Raspberry Pi 4 Kubernetes Cluster

## 障害発生時の対処
### Worker Node
1. Worker Node を再起動する。
2. Worker Node で `sudo swapoff -a` を実行し swap を無効化する。
3. Master Node で `kubeadm token create --print-join-command`　を実行し、join 用のコマンドを表示する。
4. 当該コマンドを Worker Node 上で実行する。