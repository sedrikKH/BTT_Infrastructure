# resource "aws_route53_zone" "sedrik_kh_ua" {
#   name = "sedrik.kh.ua."
# }

resource "aws_route53_record" "www" {
  zone_id = "Z06332603PCNRYDKRLB1Y"
  #zone_id = aws_route53_zone.sedrik_kh_ua.zone_id
  name = "btt-cloud.sedrik.kh.ua"
  type = "CNAME"
  ttl  = "300"
  #[kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.hostname]
  records = [kubernetes_service.alb.status.0.load_balancer.0.ingress.0.hostname]

}
