kubectl
The main entry point to Kubernetes is via its API and the best way to do so is via the command line tool, kubectl.

When you want to inspect the status of the cluster, pods, create deployments, etc — everything is done through kubectl.

Why Use kubectl?
At the moment, there are a few popular tools for Kubernetes that are alternatives for kubectl. However, I believe kubectl is the most practical tool to learn for two reasons: its abstraction is tied to Kubernetes internals and Kubernetes tools are still not fully adopted in the industry.

In fact, every time that I have contacted AWS support regarding an EKS cluster, they have asked me to run kubectl commands and to provide me the output of the various commands. Not understanding how to use kubectl basics will be a lapse in your expected Kubernetes knowledge as a DevOps engineer.

Kubernetes Abstraction
kubectl is a low level of abstraction that ties very closely to the Kubernetes cluster itself. Using it helps you understand the internals and familiarity with kubectl will enable you to quickly adopt other tools, if needed.

Industry Adoption
Alternative tools are still being adopted in the industry. These tools can be very opinionated in how they interact with Kubernetes.

Kubectl is still the de-facto way of interfacing with your cluster. I don’t want to show you how to use another tool only for you to not encounter it in the industry nor be able to adapt your existing knowledge of kubectl to other tools.

Configuring kubectl
In order for kubectl to be useful in your local environment, you will need to connect it to your cluster. This is done with your kubeconfig file (~/.kube/config). It specifies your cluster as well as some additional metadata for access.

Setting Up kubeconfig File in EKS
The AWS command line tool has a convenient method set up to set up access to your EKS cluster.

The following command will update your ~/.kube/config file:

aws eks update-kubeconfig --name <CLUSTER_NAME>
After this is set up, running kubectl commands will point to your Kubernetes cluster set up with EKS.

Common kubectl Commands
kubectl apply -f <config_file> — this command is used to apply your desired state to the cluster. If you want to create or update a resource such as a service or deployment, you would use this command.
kubectl list services - the command shows all of the available services. If you want to retrieve more information about a particular service, you can run kubectl describe service <service_name>
kubectl get pods - this command shows the pods that are running. More importantly, it shows their status, uptime, and number of replicas. I frequently use this command to inspect whether or not a deployment is healthy.
kubectl describe pod <pod_name> - this provides more information about a pod by returning its metadata