module github.com/openyurtio/yurt-app-manager-api

go 1.14

require (
	k8s.io/api v0.19.4
	k8s.io/apimachinery v0.19.4
	k8s.io/client-go v0.18.6
	sigs.k8s.io/controller-runtime v0.6.4
)

replace (
	k8s.io/api => k8s.io/api v0.16.9
	k8s.io/apimachinery => k8s.io/apimachinery v0.16.10-beta.0
	k8s.io/client-go => k8s.io/client-go v0.16.9
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.16.9
)
