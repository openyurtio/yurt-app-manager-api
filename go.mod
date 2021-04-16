module github.com/openyurtio/yurt-app-manager

go 1.15

require (
	k8s.io/api v0.19.7
	k8s.io/apimachinery v0.19.7
	sigs.k8s.io/controller-runtime v0.7.0
)

replace (
	k8s.io/api => k8s.io/api v0.19.7
	k8s.io/apimachinery => k8s.io/apimachinery v0.19.7
	sigs.k8s.io/controller-runtime => sigs.k8s.io/controller-runtime v0.7.0
)
