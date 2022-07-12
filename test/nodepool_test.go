package test

import (
	"context"
	appsv1alpha1 "github.com/openyurtio/yurt-app-manager-api/pkg/yurtappmanager/apis/apps/v1alpha1"
	fake2 "github.com/openyurtio/yurt-app-manager-api/pkg/yurtappmanager/client/clientset/versioned/fake"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/client/fake"
	"testing"
)

var scheme = runtime.NewScheme()

func init() {
	_ = appsv1alpha1.AddToScheme(scheme)
	// +kubebuilder:scaffold:scheme
}

func TestNodePoolClient(t *testing.T) {
	cs := fake2.NewSimpleClientset(&appsv1alpha1.NodePool{
		ObjectMeta: metav1.ObjectMeta{
			Name:      "bj",
			Namespace: "default",
		},
	})

	list,err := cs.AppsV1alpha1().NodePools().List(context.TODO(),metav1.ListOptions{})
	if err != nil {
		t.Fatal(err)
	}
	if len(list.Items) != 1 {
		t.Fatalf("list lenght should be one")
	}
}

func TestNodePool(t *testing.T) {
	cli := fake.NewClientBuilder().WithScheme(scheme).WithObjects(&appsv1alpha1.NodePool{
		ObjectMeta: metav1.ObjectMeta{
			Name:      "bj",
			Namespace: "default",
		},
	}).Build()

	np := & appsv1alpha1.NodePool{}
	if err := cli.Get(context.TODO(),client.ObjectKey{Namespace: "default",Name: "bj"},np); err != nil {
		t.Fatal(err)
	}
}
