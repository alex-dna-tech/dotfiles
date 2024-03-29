# MNEMONICS(k-prefix+action+object+option):
# ACTIONS:
# ---
# a - apply
# d - describe
# ex - exec
# g - get
# run - run
# rm - delete

# OBJECTS:
# ---
# cm - configmap
# dep - deployment
# ing - ingress
# lo - logs
# no - nodes
# ns - namespaces
# p - proxy
# pf - port-forward
# po - pods
# sec - secret
# sts - statefulset
# svc - service

# OPTIONS:
# ---
# w - watch
# all - all-namespaces
# f - file resource
# l - label

if [[ -x "$(command -v kubectl)" ]]; then
	alias k='kubectl'
	alias ka='kubectl apply --recursive -f'
	alias kak='kubectl apply -k'
	alias kk='kubectl kustomize'
	alias kex='kubectl exec -i -t'
	alias klo='kubectl logs -f'
	alias klop='kubectl logs -f -p'
	alias kp='kubectl proxy'
	alias kpf='kubectl port-forward'
	alias kg='kubectl get'
	alias kd='kubectl describe'
	alias krm='kubectl delete'
	alias krun='kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -i -t'
	alias kgpo='kubectl get pods'
	alias kdpo='kubectl describe pods'
	alias krmpo='kubectl delete pods'
	alias kgdep='kubectl get deployment'
	alias kddep='kubectl describe deployment'
	alias krmdep='kubectl delete deployment'
	alias kgsts='kubectl get statefulset'
	alias kdsts='kubectl describe statefulset'
	alias krmsts='kubectl delete statefulset'
	alias kgsvc='kubectl get service'
	alias kdsvc='kubectl describe service'
	alias krmsvc='kubectl delete service'
	alias kging='kubectl get ingress'
	alias kding='kubectl describe ingress'
	alias krming='kubectl delete ingress'
	alias kgcm='kubectl get configmap'
	alias kdcm='kubectl describe configmap'
	alias krmcm='kubectl delete configmap'
	alias kgsec='kubectl get secret'
	alias kdsec='kubectl describe secret'
	alias krmsec='kubectl delete secret'
	alias kgno='kubectl get nodes'
	alias kdno='kubectl describe nodes'
	alias kgns='kubectl get namespaces'
	alias kdns='kubectl describe namespaces'
	alias krmns='kubectl delete namespaces'
	alias kgall='kubectl get --all-namespaces'
	alias kdall='kubectl describe --all-namespaces'
	alias kgpoall='kubectl get pods --all-namespaces'
	alias kdpoall='kubectl describe pods --all-namespaces'
	alias kgdepall='kubectl get deployment --all-namespaces'
	alias kddepall='kubectl describe deployment --all-namespaces'
	alias kgstsall='kubectl get statefulset --all-namespaces'
	alias kdstsall='kubectl describe statefulset --all-namespaces'
	alias kgsvcall='kubectl get service --all-namespaces'
	alias kdsvcall='kubectl describe service --all-namespaces'
	alias kgingall='kubectl get ingress --all-namespaces'
	alias kdingall='kubectl describe ingress --all-namespaces'
	alias kgcmall='kubectl get configmap --all-namespaces'
	alias kdcmall='kubectl describe configmap --all-namespaces'
	alias kgsecall='kubectl get secret --all-namespaces'
	alias kdsecall='kubectl describe secret --all-namespaces'
	alias kgnsall='kubectl get namespaces --all-namespaces'
	alias kdnsall='kubectl describe namespaces --all-namespaces'
	alias krmall='kubectl delete --all'
	alias krmpoall='kubectl delete pods --all'
	alias krmdepall='kubectl delete deployment --all'
	alias krmstsall='kubectl delete statefulset --all'
	alias krmsvcall='kubectl delete service --all'
	alias krmingall='kubectl delete ingress --all'
	alias krmcmall='kubectl delete configmap --all'
	alias krmsecall='kubectl delete secret --all'
	alias krmnsall='kubectl delete namespaces --all'
	alias kgw='kubectl get --watch'
	alias kgpow='kubectl get pods --watch'
	alias kgdepw='kubectl get deployment --watch'
	alias kgstsw='kubectl get statefulset --watch'
	alias kgsvcw='kubectl get service --watch'
	alias kgingw='kubectl get ingress --watch'
	alias kgcmw='kubectl get configmap --watch'
	alias kgsecw='kubectl get secret --watch'
	alias kgnow='kubectl get nodes --watch'
	alias kgnsw='kubectl get namespaces --watch'
	alias kgallw='kubectl get --all-namespaces --watch'
	alias kgpoallw='kubectl get pods --all-namespaces --watch'
	alias kgdepallw='kubectl get deployment --all-namespaces --watch'
	alias kgstsallw='kubectl get statefulset --all-namespaces --watch'
	alias kgsvcallw='kubectl get service --all-namespaces --watch'
	alias kgingallw='kubectl get ingress --all-namespaces --watch'
	alias kgcmallw='kubectl get configmap --all-namespaces --watch'
	alias kgsecallw='kubectl get secret --all-namespaces --watch'
	alias kgnsallw='kubectl get namespaces --all-namespaces --watch'
	alias kgwall='kubectl get --watch --all-namespaces'
	alias kgpowall='kubectl get pods --watch --all-namespaces'
	alias kgdepwall='kubectl get deployment --watch --all-namespaces'
	alias kgstswall='kubectl get statefulset --watch --all-namespaces'
	alias kgsvcwall='kubectl get service --watch --all-namespaces'
	alias kgingwall='kubectl get ingress --watch --all-namespaces'
	alias kgcmwall='kubectl get configmap --watch --all-namespaces'
	alias kgsecwall='kubectl get secret --watch --all-namespaces'
	alias kgnswall='kubectl get namespaces --watch --all-namespaces'
	alias kgf='kubectl get --recursive -f'
	alias kdf='kubectl describe --recursive -f'
	alias krmf='kubectl delete --recursive -f'
	alias kgwf='kubectl get --watch --recursive -f'
	alias kgl='kubectl get -l'
	alias kdl='kubectl describe -l'
	alias krml='kubectl delete -l'
	alias kgpol='kubectl get pods -l'
	alias kdpol='kubectl describe pods -l'
	alias krmpol='kubectl delete pods -l'
	alias kgdepl='kubectl get deployment -l'
	alias kddepl='kubectl describe deployment -l'
	alias krmdepl='kubectl delete deployment -l'
	alias kgstsl='kubectl get statefulset -l'
	alias kdstsl='kubectl describe statefulset -l'
	alias krmstsl='kubectl delete statefulset -l'
	alias kgsvcl='kubectl get service -l'
	alias kdsvcl='kubectl describe service -l'
	alias krmsvcl='kubectl delete service -l'
	alias kgingl='kubectl get ingress -l'
	alias kdingl='kubectl describe ingress -l'
	alias krmingl='kubectl delete ingress -l'
	alias kgcml='kubectl get configmap -l'
	alias kdcml='kubectl describe configmap -l'
	alias krmcml='kubectl delete configmap -l'
	alias kgsecl='kubectl get secret -l'
	alias kdsecl='kubectl describe secret -l'
	alias krmsecl='kubectl delete secret -l'
	alias kgnol='kubectl get nodes -l'
	alias kdnol='kubectl describe nodes -l'
	alias kgnsl='kubectl get namespaces -l'
	alias kdnsl='kubectl describe namespaces -l'
	alias krmnsl='kubectl delete namespaces -l'
	alias kgwl='kubectl get --watch -l'
	alias kgpowl='kubectl get pods --watch -l'
	alias kgdepwl='kubectl get deployment --watch -l'
	alias kgstswl='kubectl get statefulset --watch -l'
	alias kgsvcwl='kubectl get service --watch -l'
	alias kgingwl='kubectl get ingress --watch -l'
	alias kgcmwl='kubectl get configmap --watch -l'
	alias kgsecwl='kubectl get secret --watch -l'
	alias kgnowl='kubectl get nodes --watch -l'
	alias kgnswl='kubectl get namespaces --watch -l'
	alias kpft='kubectl port-forward -n kube-system "$(kubectl get pods -n kube-system | grep "^traefik-" | awk "{print $1}")" 9000:9000'

	source <(kubectl completion bash)
fi

if [[ -x "$(command -v helm)" ]]; then
  source <(helm completion bash)
fi

if [[ -x "$(command -v k3s)" ]]; then
  source <(k3s completion bash)
fi

if [[ -x "$(command -v k3d)" ]]; then
  source <(k3d completion bash)
fi
